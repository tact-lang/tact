struct Profile {
  nickname: String;
  age: Int?;
}

contract TestContract(
  id: Int,
  info: Profile,
  referredBy: Address?,
  verified: Bool,
  comment: String?,
) {}