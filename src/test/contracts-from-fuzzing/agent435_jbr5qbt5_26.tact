// Deep recursive nested struct, with mixed serialization
struct Level5 { x: Int as uint8; y: Bool; }
struct Level4 { z: Level5; a: Int; }
struct Level3 { q: Level4; }
struct Level2 { r: Level3; s: Int as int16; }
struct Level1 { t: Level2; flag: Bool; }

contract TestContract {
    deepMix: Level1;
    init() {
        self.deepMix = Level1{
            t: Level2{
                r: Level3{
                    q: Level4{
                        z: Level5{
                            x: 255,
                            y: true,
                        },
                        a: 123456,
                    },
                },
                s: -20000,
            },
            flag: true,
        };
    }
}
