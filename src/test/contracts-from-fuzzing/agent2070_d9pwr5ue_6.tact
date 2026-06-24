struct StrTest {
    text: String;
}

struct BoolTest {
    yes: Bool;
}

contract ManyStructs {
    st1: StrTest;
    st2: StrTest;
    bt1: BoolTest;
    bt2: BoolTest;

    init() {
        self.st1 = StrTest{ text: "One" };
        self.st2 = StrTest{ text: "Two" };
        self.bt1 = BoolTest{ yes: true };
        self.bt2 = BoolTest{ yes: false };
    }
}
