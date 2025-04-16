struct Inner0 { x: Int }
struct Inner1 { f: Inner0 }
struct Inner2 { f: Inner1 }
struct Inner3 { f: Inner2 }
struct Inner4 { f: Inner3 }
struct Inner5 { f: Inner4 }
struct Inner6 { f: Inner5 }
struct Inner7 { f: Inner6 }

contract Deep8 {
    z: Inner7;

    init() {
        self.z = Inner7{
            f: Inner6{
                f: Inner5{
                    f: Inner4{
                        f: Inner3{
                            f: Inner2{
                                f: Inner1{
                                    f: Inner0{ x: 99 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}