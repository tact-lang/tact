struct MyData {
    note: String;
    amount: Int;
    enabled: Bool;
    extra: String?;
}

contract ComplexDefaults {
    rec: MyData = MyData{
        note: "a",
        amount: 42,
        enabled: true,
        extra: null
    };
}