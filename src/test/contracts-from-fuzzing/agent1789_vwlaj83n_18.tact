struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract NestedDefaultsContract {
    val: NestedDefaults = NestedDefaults{ a:2, b:false, c:"def" };
}