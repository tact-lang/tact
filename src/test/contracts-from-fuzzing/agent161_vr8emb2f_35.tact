// Contract with many mixed persistent fields: primitive, optional, structs, nested structs

struct SInner {
    flag: Bool;
    txt: String;
}

struct SMain {
    inner1: SInner;
    optInner: SInner?;
    n: Int;
    s: String?;
}

contract MixedFieldsTest {
    count: Int;
    isReady: Bool?;
    label: String;
    data: SMain;

    init() {
        self.count = 5;
        self.isReady = null;
        self.label = "start";
        self.data = SMain{
            inner1: SInner{ flag: true, txt: "ok" },
            optInner: null,
            n: 8,
            s: null,
        };
    }
}
