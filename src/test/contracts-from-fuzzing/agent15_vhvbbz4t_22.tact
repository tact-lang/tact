contract TestMapAsCell {
    m: map<Int, Int> = emptyMap();

    receive() {
         self.m.set(1, 100);
         // Convert map to a cell
         let cell = self.m.asCell();

         // Use the cell, for example, reply with it
         self.reply(cell);
    }
}
