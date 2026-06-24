struct SSub {
    flag: Bool;
    num: Int;
    text: String;
}

struct SMain {
    alpha: Int;
    beta: SSub;
    gamma: Bool;
    delta: SSub;
    epsilon: String;
}

contract TestContract {
    data: SMain;

    init() {
        self.data = SMain{
            alpha: 5,
            beta: SSub{flag:true, num:42, text:"hi"},
            gamma: false,
            delta: SSub{flag:false, num:17, text:"bye"},
            epsilon: "done"
        };
    }
}
