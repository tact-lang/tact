struct Profile {
  nickname: String?;
  age: Int?;
  active: Bool?;
}

contract OptionalFieldsParam(
  profile: Profile,
) {}