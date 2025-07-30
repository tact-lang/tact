contract TestBlockNoSemicolon {
    receive() {
         { dump(2 + 2) } // block with single statement, semicolon omitted
         return;
    }
}
