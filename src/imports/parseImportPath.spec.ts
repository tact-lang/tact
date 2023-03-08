import { parseImportPath } from './parseImportPath';

describe('parseImportPath', () => {
    it('should reject non-relative imports', () => {
        let res = parseImportPath('some_name');
        expect(res).toBeNull();
    });
    it('should reject non-file imports', () => {
        let res = parseImportPath('./some_name/');
        expect(res).toBeNull();
    });
    it('should parse single imports', () => {
        let res = parseImportPath('./import');
        expect(res).toMatchObject(['import']);
    });
    it('should parse multiple imports', () => {
        let res = parseImportPath('./import/second');
        expect(res).toMatchObject(['import', 'second']);
    });
});