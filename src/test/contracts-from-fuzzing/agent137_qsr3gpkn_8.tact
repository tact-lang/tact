struct FirstNest { one: Int; two: Bool }

struct SecondNest { nested: FirstNest; val: Int }

struct ThirdNest { deep: SecondNest; optInt: Int? }

contract MultiLayerNestedTest {
    state: ThirdNest;

    init() {
        self.state = ThirdNest{
            deep: SecondNest{
                nested: FirstNest{
                    one: 1,
                    two: false
                },
                val: 2
            },
            optInt: null
        };
    }

    receive() {}
}