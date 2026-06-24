struct SubA {
    val: Int;
}

struct SubB {
    flag: Bool;
    text: String?;
}

struct Mixed {
    a: SubA;
    b: SubB;
    number: Int;
    optString: String?;
}

contract TestContract {
    mixedData: Mixed;

    init() {
        self.mixedData = Mixed{
            a: SubA{ val: 5 },
            b: SubB{ flag: true, text: null },
            number: 123,
            optString: null,
        };
    }

    receive() {
        let _ = self.mixedData.number;
    }
}