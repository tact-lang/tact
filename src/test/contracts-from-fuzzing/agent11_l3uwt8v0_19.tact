contract TestStringAsComment {
    receive() {
        let s: String = "When life gives you lemons, call them 'yellow oranges' and sell them for double the price.";
        let cell1: Cell = s.asComment();
        let b: StringBuilder = beginComment();
        b.append(s);
        let cell2: Cell = b.toCell();
    }
}
