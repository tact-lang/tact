/* Test 9: Testing conversion from a Struct to a Cell and back using .toCell() and .fromCell()
   Expected result: 63 (7 * 9).
*/

struct CellTest {
    x: Int;
    y: Int;
}

fun main(): Int {
    let ct = CellTest{ x: 7, y: 9 };
    let cell = ct.toCell();
    let ct2 = CellTest.fromCell(cell);
    return ct2.x * ct2.y;
}
