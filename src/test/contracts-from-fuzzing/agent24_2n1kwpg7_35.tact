struct Point { x: Int; y: Int }

contract TestShadowBlock {
    receive() {
         let x: Int = 100;
         {
            let Point { x: innerX, y } = Point { x: 1, y: 2 };
            let innerSum: Int = innerX + y; // should be 3
         }
         let outer: Int = x + 0; // should be 100
    }
}
