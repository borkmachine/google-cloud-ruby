# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/dialogflow/v2/agent_pb"
require "google/cloud/dialogflow/v2/agent_services_pb"
require "google/cloud/dialogflow/v2/agents"

class Google::Cloud::Dialogflow::V2::Agents::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_get_agent
    # Create GRPC objects.
    grpc_response = Google::Cloud::Dialogflow::V2::Agent.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    get_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::GetAgentRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_agent({ parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_agent parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_agent Google::Cloud::Dialogflow::V2::GetAgentRequest.new(parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_agent({ parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_agent Google::Cloud::Dialogflow::V2::GetAgentRequest.new(parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_agent_client_stub.call_rpc_count
    end
  end

  def test_set_agent
    # Create GRPC objects.
    grpc_response = Google::Cloud::Dialogflow::V2::Agent.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    agent = {}
    update_mask = {}

    set_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::SetAgentRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Dialogflow::V2::Agent), request.agent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_agent({ agent: agent, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_agent agent: agent, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_agent Google::Cloud::Dialogflow::V2::SetAgentRequest.new(agent: agent, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_agent({ agent: agent, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_agent Google::Cloud::Dialogflow::V2::SetAgentRequest.new(agent: agent, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_agent_client_stub.call_rpc_count
    end
  end

  def test_delete_agent
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    delete_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::DeleteAgentRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_agent({ parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_agent parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_agent Google::Cloud::Dialogflow::V2::DeleteAgentRequest.new(parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_agent({ parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_agent Google::Cloud::Dialogflow::V2::DeleteAgentRequest.new(parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_agent_client_stub.call_rpc_count
    end
  end

  def test_search_agents
    # Create GRPC objects.
    grpc_response = Google::Cloud::Dialogflow::V2::SearchAgentsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    search_agents_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :search_agents, name
      assert_kind_of Google::Cloud::Dialogflow::V2::SearchAgentsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_agents_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search_agents({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search_agents parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search_agents Google::Cloud::Dialogflow::V2::SearchAgentsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search_agents({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search_agents Google::Cloud::Dialogflow::V2::SearchAgentsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_agents_client_stub.call_rpc_count
    end
  end

  def test_train_agent
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    train_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :train_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::TrainAgentRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, train_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.train_agent({ parent: parent }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.train_agent parent: parent do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.train_agent Google::Cloud::Dialogflow::V2::TrainAgentRequest.new(parent: parent) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.train_agent({ parent: parent }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.train_agent Google::Cloud::Dialogflow::V2::TrainAgentRequest.new(parent: parent), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, train_agent_client_stub.call_rpc_count
    end
  end

  def test_export_agent
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    agent_uri = "hello world"

    export_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :export_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::ExportAgentRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.agent_uri
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, export_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.export_agent({ parent: parent, agent_uri: agent_uri }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.export_agent parent: parent, agent_uri: agent_uri do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.export_agent Google::Cloud::Dialogflow::V2::ExportAgentRequest.new(parent: parent, agent_uri: agent_uri) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.export_agent({ parent: parent, agent_uri: agent_uri }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.export_agent Google::Cloud::Dialogflow::V2::ExportAgentRequest.new(parent: parent, agent_uri: agent_uri), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, export_agent_client_stub.call_rpc_count
    end
  end

  def test_import_agent
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    import_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :import_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::ImportAgentRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, import_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.import_agent({ parent: parent }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.import_agent parent: parent do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.import_agent Google::Cloud::Dialogflow::V2::ImportAgentRequest.new(parent: parent) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.import_agent({ parent: parent }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.import_agent Google::Cloud::Dialogflow::V2::ImportAgentRequest.new(parent: parent), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, import_agent_client_stub.call_rpc_count
    end
  end

  def test_restore_agent
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    restore_agent_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :restore_agent, name
      assert_kind_of Google::Cloud::Dialogflow::V2::RestoreAgentRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, restore_agent_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.restore_agent({ parent: parent }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.restore_agent parent: parent do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.restore_agent Google::Cloud::Dialogflow::V2::RestoreAgentRequest.new(parent: parent) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.restore_agent({ parent: parent }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.restore_agent Google::Cloud::Dialogflow::V2::RestoreAgentRequest.new(parent: parent), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, restore_agent_client_stub.call_rpc_count
    end
  end

  def test_get_validation_result
    # Create GRPC objects.
    grpc_response = Google::Cloud::Dialogflow::V2::ValidationResult.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    language_code = "hello world"

    get_validation_result_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_validation_result, name
      assert_kind_of Google::Cloud::Dialogflow::V2::GetValidationResultRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.language_code
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_validation_result_client_stub do
      # Create client
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_validation_result({ parent: parent, language_code: language_code }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_validation_result parent: parent, language_code: language_code do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_validation_result Google::Cloud::Dialogflow::V2::GetValidationResultRequest.new(parent: parent, language_code: language_code) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_validation_result({ parent: parent, language_code: language_code }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_validation_result Google::Cloud::Dialogflow::V2::GetValidationResultRequest.new(parent: parent, language_code: language_code), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_validation_result_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::Dialogflow::V2::Agents::Client::Configuration, config
  end

  def test_operations_client
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Dialogflow::V2::Agents::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    assert_kind_of Google::Cloud::Dialogflow::V2::Agents::Operations, client.operations_client
  end
end
