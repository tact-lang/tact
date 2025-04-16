struct OptionalString {
    s1: String?;
    s2: String?;
}

contract TestContract {
    data: OptionalString;

    init() {
        self.data = OptionalString{ s1:null, s2:null };
    }
}