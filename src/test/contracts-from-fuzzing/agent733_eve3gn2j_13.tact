struct LongNames {
  this_is_an_extremely_long_variable_name_that_should_be_supported_intended_for_persistence: Int = 123;
  another_extremely_long_identifier_to_push_parser_and_storage_limits: Bool = true;
}

contract TestContract {
  data: LongNames = LongNames{};
  init() {}
}