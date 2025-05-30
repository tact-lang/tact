struct Alpha { x: Int }
struct Beta { y: Alpha }
struct Gamma { z: Beta }

contract DeepDefaults {
    g: Gamma = Gamma{
        z: Beta{ y: Alpha{ x: 999 } }
    };

    init() {
        self.g = Gamma{
            z: Beta { y: Alpha{ x: 100 } }
        };
    }
}
