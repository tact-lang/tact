struct Compose1 { val: Int; }
struct Compose2 { val: Compose1; }
struct Compose3 { val: Compose2; }
struct Compose4 { val: Compose3; }
struct Compose5 { val: Compose4; }

contract Test10 {
    data: Compose5;
    init() {
        self.data = Compose5{
            val: Compose4{
                val: Compose3{
                    val: Compose2{
                        val: Compose1{val:123}
                    }
                }
            }
        };
    }
}