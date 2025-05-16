struct ContainsString {
    str: String;
}

contract LargeStrings {
    cs1: ContainsString;
    cs2: ContainsString;

    init() {
        self.cs1 = ContainsString{ str: "A very very very very very long string here..." };
        self.cs2 = ContainsString{ str: "Another long long long string in storage!" };
    }
}