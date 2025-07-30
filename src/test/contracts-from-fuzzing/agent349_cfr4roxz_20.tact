// Test implicit default nulls of optional persistent fields
contract ImplicitNulls {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;

  init() {
    // assign nothing, test compiler handles implicit null
  }
}