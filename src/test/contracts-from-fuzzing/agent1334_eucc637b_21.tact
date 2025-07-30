struct OptionalDeep1 { val: Int? }
struct OptionalDeep2 { v: OptionalDeep1? }
struct OptionalDeep3 { v: OptionalDeep2? }

contract OptDeepNested {
    d: OptionalDeep3;

    init() {
        self.d = OptionalDeep3{ v:null }; 
    }
}