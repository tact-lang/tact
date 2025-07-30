struct Inner {
    value: Int;
}

struct Middle {
    innerOpt: Inner?;
}

contract TestContract {
    myMiddle: Middle;

    init() {
        self.myMiddle = Middle{
            innerOpt: Inner{value: 10}
        };
    }
}