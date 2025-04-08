trait TraitA {
    owner: Address;
}

contract TraitParams(
    owner: Address,
    id: Int,
) with TraitA {}
