struct ContainsString {
    data: String;
}

struct ContainsOptionalStruct {
    inner: ContainsString?;
}

contract WithOptionalStruct {
    val: ContainsOptionalStruct;

    init() {
        self.val = ContainsOptionalStruct{
            inner: ContainsString{ data: "test" }
        };
    }
}