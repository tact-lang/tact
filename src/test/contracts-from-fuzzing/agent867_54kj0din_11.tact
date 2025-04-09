// optional container struct containing nested optional struct
struct InnerOpt {
    x: Int;
    y: Bool;
}

struct ContainerOpt {
    inner: InnerOpt?;
    label: String;
}

contract TestContract {
    val: ContainerOpt = ContainerOpt{ inner: null, label: "none" };

    init() {
        self.val = ContainerOpt{
            inner: InnerOpt{ x: 3, y: true },
            label: "set"
        };
    }
}
