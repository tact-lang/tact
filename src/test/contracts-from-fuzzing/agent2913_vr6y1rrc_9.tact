struct Small { x: Int }

struct DefaultOuter {
    obj: Small? = null;
    n: Int = 0;
}

contract DefaultsContract {
    data: DefaultOuter;
    
    init() {
        self.data = DefaultOuter{
            obj: null,
            n: 42,
        };
    }
}