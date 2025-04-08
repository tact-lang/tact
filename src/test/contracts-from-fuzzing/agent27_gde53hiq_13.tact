trait HasOwner {
    owner: Address;
}

contract ChildContract(
    owner: Address,
    data: Int?,
    text: String
) with HasOwner {}