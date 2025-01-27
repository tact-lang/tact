primitive Int;
trait BaseTrait {}

contract Contract {
    a: Int;

    init() {
        let a = 100;
        self.a = self;
    }
}
