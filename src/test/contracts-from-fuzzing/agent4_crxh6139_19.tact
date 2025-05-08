/*
   DestructTest verifies the destructuring assignment for structs.
   We define a struct Coordinates with fields x and y,
   and a contract that receives a Coordinates parameter, then destructures it, 
   ensuring that x equals 10 and y equals 20.
*/

struct Coordinates {
    x: Int;
    y: Int;
}

contract DestructTest(coord: Coordinates) {
    receive() {
        let Coordinates { x, y } = self.coord;
        require(x == 10, "Incorrect x");
        require(y == 20, "Incorrect y");
        cashback(sender());
    }
}
