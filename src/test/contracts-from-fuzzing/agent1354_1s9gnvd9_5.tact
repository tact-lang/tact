struct Sub {
    enabled: Bool;
    amount: Int;
    note: String;
}

struct Main {
    count: Int;
    sub1: Sub;
    text: String;
    sub2: Sub;
    finalFlag: Bool;
}

contract TestContract {
    data: Main;

    init() {
        self.data = Main{
            count: 1,
            sub1: Sub{
                enabled: true,
                amount: 100,
                note: "abc"
            },
            text: "hi",
            sub2: Sub{
                enabled: false,
                amount: 200,
                note: "xyz"
            },
            finalFlag: true
        };
    }
}