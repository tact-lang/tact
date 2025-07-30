// Optional struct default assigned to null with optional inner fields
struct Inner {
    z: Int? = null;
}

contract OptInOpt {
    s: Inner? = null;

    init() {
        self.s = null;
    }
}