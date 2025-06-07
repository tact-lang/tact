struct SStrDef {
    s: String = "h"
}

contract StrDefaultStorage {
    data: SStrDef;

    init() {
        self.data = SStrDef{};
    }

    receive() {
        let _ = self.data;
    }
}