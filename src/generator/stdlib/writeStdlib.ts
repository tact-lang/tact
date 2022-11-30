const stdlib: { [key: string]: string } = {
    '__tact_get': 'forall X -> X __tact_get(tuple x, int i) asm "INDEXVAR";',
    '__tact_set': 'forall X -> tuple __tact_set(tuple x, int i, X v) asm "SETINDEXVARQ";',
    '__tact_tuple': 'forall X -> tuple __tact_tuple(X x) asm "TUPLE";'
}

export function writeStdlib(libs: string[]) {
    let r = '';
    for (let l of libs) {
        if (stdlib[l]) {
            if (r !== '') {
                r = r + '\n';
            }
            r += stdlib[l];
        } else {
            throw Error('Unknown stdlib function: ' + l);
        }
    }
    return r + '\n';
}