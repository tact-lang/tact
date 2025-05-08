// Persistent state variable initialized to an optional struct with nested optional primitive while using defaults
struct SubOpt {
    x:Int? = null;
    y:Bool? = null;
}

contract StateWithDefaults {
    state: SubOpt? = null;
    init() {
        self.state = null;
    }
}