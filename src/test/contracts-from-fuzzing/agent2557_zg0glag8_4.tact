struct DeepNest3 { val3: Int; }
struct DeepNest2 { nest3: DeepNest3; }
struct DeepNest1 { nest2: DeepNest2; }

contract TestContract {
    deep: DeepNest1;
    init() {
        self.deep = DeepNest1{ nest2: DeepNest2{ nest3: DeepNest3{ val3: 777 } } };
    }
}