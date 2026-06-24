fun test_block_stmt(): Int {
    { 
       let a = 1;
       let b = 2  // no semicolon for the last statement in this block, allowed in a statement context
    }
    return 42;
}
