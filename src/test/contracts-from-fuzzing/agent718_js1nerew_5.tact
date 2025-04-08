struct BigNested1 { inner: BigNested2; val: Int }
struct BigNested2 { inner: BigNested3; val: Int }
struct BigNested3 { inner: BigNested4; val: Int }
struct BigNested4 { inner: BigNested5; val: Int }
struct BigNested5 { val: Int }

contract DeepNestTest {
    field: BigNested1;

    init() {
        self.field = BigNested1{
            inner: BigNested2{
                inner: BigNested3{
                    inner: BigNested4{
                        inner: BigNested5{
                            val: 77
                        },
                        val: 66
                    },
                    val: 55
                },
                val: 44
            },
            val: 33
        };
    }
}