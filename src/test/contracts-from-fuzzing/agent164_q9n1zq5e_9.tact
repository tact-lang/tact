struct Child {
    val: String;
}

struct Parent {
    child: Child?;
    name: String;
}

contract TestContract {
    info: Parent = Parent{
        child: null,
        name: "Parent"
    };

    receive() {
        if (self.info.child != null) {
            let _ = self.info.child!! .val;
        }
    }
}