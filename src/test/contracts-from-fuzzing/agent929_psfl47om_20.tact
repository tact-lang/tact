struct NestedInit {
    inn: Int = 2;
}

contract ContractWithDefaultStruct {
    nested: NestedInit = NestedInit{};
}