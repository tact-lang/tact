contract DebugCellDump {
    receive() {
        let cell: Cell = beginCell().endCell();
        dump(cell);
    }
}
