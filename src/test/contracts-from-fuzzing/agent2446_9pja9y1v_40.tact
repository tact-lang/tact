// deeply nested contract fields with many optionals and defaults
struct DN3 {
    x: Int?;
    y: Bool?;
}

struct DN2 {
    mid: DN3;
    flag: Bool;
}

struct DN1 {
    core: DN2;
    label: String?;
}

contract DeepOptDefaults {
    state: DN1;

    init() {
        self.state = DN1{
            core: DN2{
                mid: DN3{ x:null, y:true },
                flag: false
            },
            label: null
        };
    }
}