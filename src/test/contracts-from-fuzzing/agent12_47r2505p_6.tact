trait HasX {
    // Persistent variable x: must be defined in contract
    x: Int;
}

trait HasY {
    // Persistent variable y: must be defined in contract
    y: Int;
}

contract Sum(x: Int, y: Int) with HasX, HasY {
    // No need to redeclare x and y
    receive() {
        let s = self.x + self.y; // expected sum of x and y
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: s.toString().asComment()
        });
    }
}
