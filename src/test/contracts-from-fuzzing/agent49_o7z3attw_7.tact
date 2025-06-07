const SAMPLE_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

contract Test {
    receive() {
        let c: Cell = SAMPLE_CELL;
    }
}
