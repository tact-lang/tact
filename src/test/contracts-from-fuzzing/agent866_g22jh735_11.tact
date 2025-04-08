struct UserData {
    id: Int;
    name: String;
    active: Bool?;
}

contract StructParam(
    user: UserData,
) {}

contract Dummy { receive(){} }