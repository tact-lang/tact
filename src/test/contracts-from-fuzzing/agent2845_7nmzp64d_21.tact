struct Val1 { f: Int }
struct Val2 { f: Bool }
struct Val3 { f: String }

struct Contain {
    v1: Val1;
    v2: Val2;
    v3: Val3;
    flag: Bool;
}

contract ContainerMixTypes {
    storage: Contain;

    init() {
        self.storage = Contain{
            v1: Val1{f:33},
            v2: Val2{f:true},
            v3: Val3{f:"ok"},
            flag: true
        };
    }
}