struct SuperDeep1 { x: Int }
struct SuperDeep2 { s: SuperDeep1 }
struct SuperDeep3 { s: SuperDeep2 }
struct SuperDeep4 { s: SuperDeep3 }
struct SuperDeep5 { s: SuperDeep4 }
struct SuperDeep6 { s: SuperDeep5 }

contract SuperDeepTest {
    v: SuperDeep6;

    init() {
        self.v = SuperDeep6 {
            s: SuperDeep5 {
                s: SuperDeep4 {
                    s: SuperDeep3 {
                        s: SuperDeep2 {
                            s: SuperDeep1 { x: 123 }
                        }
                    }
                }
            }
        };
    }
}
