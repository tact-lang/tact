struct NestedStringOpt {
    txt: String?;
}

struct ContainsNSO {
    nso: NestedStringOpt;
}

contract NestedOptString {
    f: ContainsNSO = ContainsNSO{nso: NestedStringOpt{txt: null}};

    receive() {
        self.f = ContainsNSO{nso: NestedStringOpt{txt: "hi"}};
    }
}