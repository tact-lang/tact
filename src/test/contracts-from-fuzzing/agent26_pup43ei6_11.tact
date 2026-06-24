struct OptDeep1 { val: OptDeep2?; }
struct OptDeep2 { val: OptDeep3?; }
struct OptDeep3 { val: OptDeep4?; }
struct OptDeep4 { val: Int?; }

contract Test11 {
    d: OptDeep1;

    init() {
        self.d = OptDeep1{
            val: OptDeep2{
                val: OptDeep3{
                    val: OptDeep4{
                        val: 7
                    }
                }
            }
        };
    }
}