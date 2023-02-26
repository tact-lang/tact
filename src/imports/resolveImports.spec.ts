import { resolveImports } from './resolveImports';
import { createNodeFileSystem } from '../vfs/createNodeFileSystem';
import path from 'path';

describe('resolveImports', () => {
    it('should resolve imports', () => {
        let project = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'project'));
        let stdlib = createNodeFileSystem(path.resolve(__dirname, '__testdata', 'stdlib'));
        let resolved = resolveImports({
            project,
            stdlib,
            entrypoint: './main.tact'
        });
        expect(resolved).toMatchSnapshot();
    });
});