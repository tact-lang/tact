// Struct with optional string field without explicit null default
struct OptString {
  s: String?;
}

contract OptStringField {
  st: OptString;
  init() {
    self.st = OptString{ s: null };
  }
}