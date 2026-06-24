// optional nested init assigned inline const
struct Inner { x: Int }

contract OptConst {
    f: Inner? = null;

    init() {
        self.f = null;
    }
}