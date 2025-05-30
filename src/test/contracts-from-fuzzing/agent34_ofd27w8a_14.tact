struct OptionalDeep1 { s: String?; }
struct OptionalDeep2 { nest: OptionalDeep1?; }
struct OptionalDeep3 { nest: OptionalDeep2?; }
struct OptionalDeep4 { nest: OptionalDeep3?; }

contract DeeplyOptionalized {
    root: OptionalDeep4?;

    init() {
        self.root = OptionalDeep4{
            nest: OptionalDeep3{
                nest: OptionalDeep2{
                    nest: OptionalDeep1{ s: "hi" }
                }
            }
        };
    }
}