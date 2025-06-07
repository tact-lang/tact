struct Profile {
  nick: String;
  bio: String?;
}

contract TestContract(
  id: Int,
  active: Bool,
  user: Profile
) {}