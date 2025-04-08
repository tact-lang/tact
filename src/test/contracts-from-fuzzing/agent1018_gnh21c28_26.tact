struct NestedDefaults {
    a: Int = 3;
    b: Bool? = null;
}

contract ContractNestedDefaults {
    x: NestedDefaults = NestedDefaults{ a:4, b:true };
}