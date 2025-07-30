struct Profile {
  nickname: String;
  id: Int;
}

struct Meta {
  creator: Profile;
  status: Bool;
}

contract TestContract(
  info: Meta,
  comments: String?,
  rating: Int?,
) {}