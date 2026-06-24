struct LargeOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int? = null;
    e: Bool? = null;
    f: String? = "hi";
}

contract ContractWithLargeOptionalDefaults {
    val: LargeOptionalDefaults = LargeOptionalDefaults{};
}