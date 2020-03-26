# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/translate/v3/translation_service.proto for package 'Google::Cloud::Translate::V3'
# Original file comments:
# Copyright 2019 Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#


require 'grpc'
require 'google/cloud/translate/v3/translation_service_pb'

module Google::Cloud::Translate::V3
  module TranslationService
    # Proto file for the Cloud Translation API (v3 GA).
    #
    # Provides natural language translation operations.
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'google.cloud.translation.v3.TranslationService'

      # Translates input text and returns translated text.
      rpc :TranslateText, TranslateTextRequest, TranslateTextResponse
      # Detects the language of text within a request.
      rpc :DetectLanguage, DetectLanguageRequest, DetectLanguageResponse
      # Returns a list of supported languages for translation.
      rpc :GetSupportedLanguages, GetSupportedLanguagesRequest, SupportedLanguages
      # Translates a large volume of text in asynchronous batch mode.
      # This function provides real-time output as the inputs are being processed.
      # If caller cancels a request, the partial results (for an input file, it's
      # all or nothing) may still be available on the specified output location.
      #
      # This call returns immediately and you can
      # use google.longrunning.Operation.name to poll the status of the call.
      rpc :BatchTranslateText, BatchTranslateTextRequest, Google::Longrunning::Operation
      # Creates a glossary and returns the long-running operation. Returns
      # NOT_FOUND, if the project doesn't exist.
      rpc :CreateGlossary, CreateGlossaryRequest, Google::Longrunning::Operation
      # Lists glossaries in a project. Returns NOT_FOUND, if the project doesn't
      # exist.
      rpc :ListGlossaries, ListGlossariesRequest, ListGlossariesResponse
      # Gets a glossary. Returns NOT_FOUND, if the glossary doesn't
      # exist.
      rpc :GetGlossary, GetGlossaryRequest, Glossary
      # Deletes a glossary, or cancels glossary construction
      # if the glossary isn't created yet.
      # Returns NOT_FOUND, if the glossary doesn't exist.
      rpc :DeleteGlossary, DeleteGlossaryRequest, Google::Longrunning::Operation
    end

    Stub = Service.rpc_stub_class
  end
end